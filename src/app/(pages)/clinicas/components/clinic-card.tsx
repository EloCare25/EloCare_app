"use client";
import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Button,
  Divider,
} from "@heroui/react";
import Link from "next/link";
import type { Clinic } from "@/app/lib/queries";

export default function ClinicCard({ clinic }: { clinic: Clinic }) {
  return (
    <div className="w-full md:max-w-2/3 m-auto">
      <Card className="w-full">
        <CardHeader className="flex gap-3">
          <h2 className="text-2xl">{clinic.nome_fantasia}</h2>
        </CardHeader>
        <Divider />
        <CardBody className="p-8">
          <h3 className="text-xl">Especialidades</h3>
          {clinic.especialidades && (
            <ul className="list-inside list-disc mt-2 pl-2">
              {clinic.especialidades.split(",").map((esp) => (
                <li key={esp}>{esp}</li>
              ))}
            </ul>
          )}
          <h3 className="text-xl mt-8">Localização</h3>
          <address className="not-italic">
            {clinic.endereco} - CEP:{clinic.cep}
            <br />
            {clinic.cidade} - {clinic.estado}
          </address>
          <h3 className="text-xl mt-8">Contato</h3>
          <dl>
            <div className="flex flex-col md:flex-row gap-1">
              <dt>Horário de funcionamento:</dt>
              <dd>{clinic.horario_funcionamento}</dd>
            </div>
            <div className="flex flex-col md:flex-row gap-1 mt-2">
              <dt>telefone:</dt>
              <dd>{clinic.telefone_comercial}</dd>
            </div>
          </dl>
        </CardBody>
        <Divider />
        <CardFooter className="flex gap-4">
          <Button
            as={Link}
            href={`tel:${clinic.telefone_comercial}`}
            color="primary"
          >
            Entrar em contato
          </Button>
          <Button
            as={Link}
            href="https://maps.google.com"
            color="default"
            target="_blank"
          >
            Ver no mapa{" "}
            <svg
              aria-hidden="true"
              fill="none"
              focusable="false"
              height="1em"
              shape-rendering="geometricPrecision"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="1.5"
              viewBox="0 0 24 24"
              width="1em"
              className="flex mx-1 text-current self-center"
            >
              <path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6"></path>
              <path d="M15 3h6v6"></path>
              <path d="M10 14L21 3"></path>
            </svg>
          </Button>
        </CardFooter>
      </Card>
      <Link href="/clinicas" className="underline mt-6 float-right">
        Ver todas as clínicas
      </Link>
    </div>
  );
}
