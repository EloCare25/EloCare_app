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
  "https://images.unsplash.com/photo-1629909613654-28e377c37b09",
  "https://plus.unsplash.com/premium_photo-1675686363477-c28d5bf65adb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1582798993202-b2d35d9620be",
  "https://images.unsplash.com/photo-1550998592-38379c536449",
  "https://images.unsplash.com/photo-1584281896894-3a5570d5885e",
  "https://images.unsplash.com/photo-1505751172876-fa1923c58548",
];

export function getAllClinics() {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM clinicas
    ORDER BY razao_social ASC
  `);
  return stmt.all().map((c, i) => ({
    ...(c as {}),
    imagem: temp_images[i % temp_images.length],
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

export function getAllTransports() {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM clinicas
    WHERE id_clinica > 5
    ORDER BY estado DESC
  `);
  return stmt.all().map((c, i) => ({
    ...(c as {}),
    imagem: temp_images[i],
  })) as Clinic[];
}

export interface Equipment {
  id_equipamento: number;
  id_fornecedor: number;
  nome: string;
  descricao: string | null;
  categoria: string | null;
  marca: string | null;
  modelo: string | null;
  preco: number | null;
  estoque: number;
  status: string;
  imagem_url: string | null;
  data_cadastro: string;
}

export function getAllEquipments() {
  const db = getDb();
  const stmt = db.prepare(`
    SELECT *
    FROM equipamentos
    ORDER BY nome ASC
  `);
  return stmt.all() as Equipment[];
}
