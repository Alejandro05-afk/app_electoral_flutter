import { Client, Users, Databases, ID } from 'node-appwrite';

export default async ({ req, res, log, error }) => {
  const client = new Client()
    .setEndpoint(process.env.APPWRITE_FUNCTION_API_ENDPOINT)
    .setProject(process.env.APPWRITE_FUNCTION_PROJECT_ID)
    .setKey(req.headers['x-appwrite-key'] ?? '');

  const DB_ID = process.env.DB_ID;
  if (!DB_ID) {
    error('DB_ID not configured');
    return res.json({ ok: false, error: 'DB_ID not configured' }, 500);
  }

  const users = new Users(client);
  const db = new Databases(client);
  const body = JSON.parse(req.body);

  try {
    const user = await users.create(
      ID.unique(),
      body.email,
      undefined,
      'Ecuador2026',
      `${body.nombres} ${body.apellidos}`
    );

    await users.updateLabels(user.$id, [body.role]);

    await db.createDocument(
      DB_ID,
      'users_profile',
      ID.unique(),
      {
        user_id: user.$id,
        cedula: body.cedula,
        nombres: body.nombres,
        apellidos: body.apellidos,
        telefono: body.telefono,
        role: body.role,
        recinto_id: body.recinto_id,
        created_by: body.created_by,
        must_change_password: true,
      }
    );

    if (body.role === 'recinto') {
      await db.updateDocument(DB_ID, 'recintos', body.recinto_id, {
        coordinador_id: user.$id,
      });
    }

    return res.json({ ok: true, userId: user.$id });
  } catch (err) {
    error('Error: ' + err.message);
    return res.json({ ok: false, error: err.message }, 500);
  }
};
