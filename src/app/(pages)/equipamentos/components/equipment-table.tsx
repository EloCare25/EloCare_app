"use client";

import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  Chip,
} from "@heroui/react";
import type { Equipment } from "@/app/lib/queries";

interface EquipmentTableProps {
  data: Equipment[];
}

export default function EquipmentTable({ data }: EquipmentTableProps) {
  const columns = [
    { key: "nome", label: "Nome" },
    { key: "categoria", label: "Categoria" },
    { key: "marca", label: "Marca" },
    { key: "modelo", label: "Modelo" },
    { key: "preco", label: "Preço" },
    { key: "estoque", label: "Estoque" },
    { key: "status", label: "Status" },
  ];

  const formatPrice = (price: number | null) => {
    if (!price) return "-";
    return new Intl.NumberFormat("pt-BR", {
      style: "currency",
      currency: "BRL",
    }).format(price);
  };

  const getStatusColor = (status: string) => {
    switch (status.toLowerCase()) {
      case "disponivel":
        return "success";
      case "indisponivel":
        return "danger";
      case "manutencao":
        return "warning";
      default:
        return "default";
    }
  };

  return (
    <Table aria-label="Tabela de equipamentos">
      <TableHeader columns={columns}>
        {(column) => (
          <TableColumn key={column.key}>{column.label}</TableColumn>
        )}
      </TableHeader>
      <TableBody items={data}>
        {(item) => (
          <TableRow key={item.id_equipamento}>
            <TableCell>{item.nome}</TableCell>
            <TableCell>{item.categoria || "-"}</TableCell>
            <TableCell>{item.marca || "-"}</TableCell>
            <TableCell>{item.modelo || "-"}</TableCell>
            <TableCell>{formatPrice(item.preco)}</TableCell>
            <TableCell>{item.estoque}</TableCell>
            <TableCell>
              <Chip color={getStatusColor(item.status)} size="sm" variant="flat">
                {item.status}
              </Chip>
            </TableCell>
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
}
