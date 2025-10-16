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
  imagem: string | null;
}


const temp_images = [
  "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d",
  "https://images.unsplash.com/photo-1631248055158-edec7a3c072b",
  "https://images.unsplash.com/photo-1453847668862-487637052f8a",
  "https://images.unsplash.com/photo-1616391182219-e080b4d1043a",
  "https://images.unsplash.com/photo-1629909613654-28e377c37b09"
]


export function getAllClinics() {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM clinicas
    ORDER BY razao_social ASC
  `);
  return stmt.all().map((c, i) => ({
    ...c as {},
    imagem: temp_images[i],
  })) as Clinic[];
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
