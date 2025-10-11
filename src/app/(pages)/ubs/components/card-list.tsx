"use client";
import { useState, useRef } from "react";
import {
  Card,
  CardHeader,
  CardFooter,
  Chip,
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  Spacer,
  Input,
  ScrollShadow,
  useDisclosure,
} from "@heroui/react";

interface UbsItem {
  CNES: string;
  UF: string;
  IBGE: string;
  NOME: string;
  LOGRADOURO: string;
  BAIRRO: string;
  LATITUDE: string;
  LONGITUDE: string;
}

const categoryColors = {
  Consulta: "primary",
  Exame: "success",
  Tratamento: "secondary",
  Vacinação: "warning",
  Checkup: "default",
  Emergência: "danger",
} as const;

const getRandomChips = (maxCount = 3) => {
  const chips = Object.keys(categoryColors);
  const shuffled = chips.sort(() => Math.random() - 0.5);
  const randomCount = Math.floor(Math.random() * maxCount) + 1;
  return shuffled.slice(0, randomCount);
};

const SearchIcon = () => {
  return (
    <svg
      aria-hidden="true"
      fill="none"
      focusable="false"
      height="1em"
      role="presentation"
      viewBox="0 0 24 24"
      width="1em"
    >
      <path
        d="M11.5 21C16.7467 21 21 16.7467 21 11.5C21 6.25329 16.7467 2 11.5 2C6.25329 2 2 6.25329 2 11.5C2 16.7467 6.25329 21 11.5 21Z"
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
      />
      <path
        d="M22 22L20 20"
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
      />
    </svg>
  );
};

export function CardList({ data }: { data: UbsItem[] }) {
  const chipsRef = useRef(new Map<string, (keyof typeof categoryColors)[]>());
  const [current, setCurrent] = useState<UbsItem>();

  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const chipsFor = (id: string) => {
    if (!chipsRef.current.has(id)) {
      chipsRef.current.set(
        id,
        getRandomChips(4) as (keyof typeof categoryColors)[],
      );
    }
    return chipsRef.current.get(id)!;
  };

  return (
    <>
      <div>
        <div className="flex justify-between gap-3 items-end mb-6">
          <Input
            isClearable
            className="w-full sm:max-w-[44%]"
            placeholder="Buscar"
            startContent={<SearchIcon />}
          />
        </div>

        <ScrollShadow hideScrollBar>
          <div className="max-h-[calc(100vh-200px)]">
            <div className="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3">
              {data.map((item: UbsItem) => (
                <Card
                  className="py-4 bg-[#b3b0c1]"
                  key={item.CNES}
                  isPressable
                  isBlurred
                  onPress={() => {
                    setCurrent(item);
                    onOpen();
                  }}
                >
                  <CardHeader className="pb-0 pt-2 px-4 flex-col items-start text-left">
                    <p className="text-tiny uppercase font-semibold mb-1">
                      {item.NOME}
                    </p>
                    <small className="text-default-500">{item.BAIRRO}</small>
                  </CardHeader>
                  <CardFooter className="text-small font-semibold">
                    <ul className="flex gap-4 flex-wrap">
                      {chipsFor(item.CNES).map((chip) => (
                        <Chip
                          key={chip}
                          color={
                            categoryColors[chip as keyof typeof categoryColors]
                          }
                        >
                          {chip}
                        </Chip>
                      ))}
                    </ul>
                  </CardFooter>
                </Card>
              ))}
            </div>
          </div>
        </ScrollShadow>
      </div>

      <Drawer
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        placement="right"
        backdrop="blur"
        size="lg"
      >
        <DrawerContent>
          {() => (
            <>
              <DrawerHeader className="flex flex-col gap-1">
                {current?.NOME} - {current?.LOGRADOURO}
              </DrawerHeader>
              <DrawerBody>
                <div className="flex flex-col gap-x-3 gap-y-7">
                  <iframe
                    src={`https://www.google.com/maps?q=${current?.LATITUDE.replace(",", ".")},${current?.LONGITUDE.replace(",", ".")}&z=15&output=embed`}
                    width="100%"
                    height="250"
                    loading="lazy"
                    referrerPolicy="no-referrer-when-downgrade"
                  ></iframe>
                  <div>
                    <h4 className="font-semibold text-xl mb-3.5">Serviços</h4>
                    <ul className="flex gap-4 flex-wrap">
                      {chipsFor(current?.CNES as string).map((chip) => (
                        <li key={chip}>
                          <Chip
                            key={chip}
                            color={
                              categoryColors[
                                chip as keyof typeof categoryColors
                              ]
                            }
                          >
                            {chip}
                          </Chip>
                        </li>
                      ))}
                    </ul>
                    <Spacer y={10} />
                    <h4 className="font-semibold text-xl">
                      Horário de atendimento
                    </h4>
                    <span>
                      <p>Segunda a Sexta: 08:00 - 18:00</p>
                      <p>Sábado: 09:00 - 17:00</p>
                    </span>
                  </div>
                </div>
              </DrawerBody>
            </>
          )}
        </DrawerContent>
      </Drawer>
    </>
  );
}
