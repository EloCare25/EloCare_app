import data from "@/app/resources/ubs-sp.json";
import type { Metadata } from "next";
import { CardList } from "./components/card-list";

export default function UbsPage() {
  return <CardList data={data.slice(0, 20)} />;
}

export const metadata: Metadata = {
  title: "EloCare | Buscar UBS",
  description: "Busque uma UBS por sua localização",
};
