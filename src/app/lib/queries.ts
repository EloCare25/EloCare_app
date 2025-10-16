import getDb from "./db";

export interface Clinic {
  id_clinica: number;
  id_usuario: number;
  cnpj: string;
  razao_social: string;
  nome_fantasia: string | null;
  endereco: string | null;
  cidade: string | null;
  estado: string | null;
  cep: string | null;
  telefone_comercial: string | null;
  especialidades: string | null;
  horario_funcionamento: string | null;
}

export function getAllClinics() {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM clinicas
    ORDER BY razao_social ASC
  `);
  return stmt.all() as Clinic[];
}

export function getClinicById(id: number | string) {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM clinicas
    WHERE id_clinica = ?
  `);
  return stmt.get(id) as Clinic;
}
