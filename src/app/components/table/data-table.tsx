"use client";
import { users } from "./data";
import data from "@/app/resources/ubs-sp.json";
import { useState, useEffect, useMemo, useCallback } from "react";
import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  Input,
  Button,
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  DrawerFooter,
  Chip,
  useDisclosure,
  Spacer,
} from "@heroui/react";
import type { SVGProps, Key } from "react";

export type IconSvgProps = SVGProps<SVGSVGElement> & {
  size?: number;
};

const SearchIcon = (props: IconSvgProps) => {
  return (
    <svg
      aria-hidden="true"
      fill="none"
      focusable="false"
      height="1em"
      role="presentation"
      viewBox="0 0 24 24"
      width="1em"
      {...props}
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


const InfoIcon = () => {
  return (
    <svg
      width="16px"
      height="16px"
      viewBox="0 0 16 16"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        fill="#aaa"
        d="M8,0 C12.4183,0 16,3.58173 16,8 C16,12.4183 12.4183,16 8,16 C3.58167,16 0,12.4183 0,8 C0,3.58173 3.58167,0 8,0 Z M8,2 C4.68628,2 2,4.68628 2,8 C2,11.3137 4.68628,14 8,14 C11.3137,14 14,11.3137 14,8 C14,4.68628 11.3137,2 8,2 Z M8,7 C8.51280357,7 8.93550255,7.38604429 8.99327177,7.88337975 L9,8 L9,11 C9,11.5523 8.55225,12 8,12 C7.48719643,12 7.06449745,11.613973 7.00672823,11.1166239 L7,11 L7,8 C7,7.44772 7.44775,7 8,7 Z M8,4 C8.55225,4 9,4.44772 9,5 C9,5.55228 8.55225,6 8,6 C7.44775,6 7,5.55228 7,5 C7,4.44772 7.44775,4 8,4 Z"
      />
    </svg>
  );
};

const columns = [
  { name: "id", uid: "id", sortable: false },
  { name: "Nome", uid: "name", sortable: false },
  { name: "Rua", uid: "street", sortable: false },
  { name: "Bairro", uid: "neighborhood", sortable: false },
  { name: "", uid: "info", sortable: false },
];

type Item = (typeof data)[0];

export default function DataTable() {
  const [curr, setCurr] = useState<Item>();
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const headerColumns = columns.filter((column) =>
    Array.from(["name", "street", "neighborhood", "info"]).includes(column.uid),
  );

  useEffect(() => {
    if(curr){
      onOpen();
    }
  }, [curr]);

  const renderCell = useCallback((item: Item, columnKey: Key) => {
    const cellValue = item[columnKey as keyof Item];

    switch (columnKey) {
      case "name":
        return (
          <div className="flex flex-col">
            <p className="text-bold text-small capitalize">{cellValue}</p>
            <p className="text-bold text-tiny capitalize text-default-400">
              {item.NOME}
            </p>
          </div>
        );
      case "street":
        return (
          <div className="flex flex-col">
            <p className="text-bold text-small capitalize">{cellValue}</p>
            <p className="text-bold text-tiny capitalize text-default-400">
              {item.LOGRADOURO}
            </p>
          </div>
        );
      case "neighborhood":
        return (
          <div className="flex flex-col">
            <p className="text-bold text-small capitalize">{cellValue}</p>
            <p className="text-bold text-tiny capitalize text-default-400">
              {item.BAIRRO}
            </p>
          </div>
        );
      case "info":
        return (
          <Button
            className="flex flex-col cursor-pointer p-1"
            size="sm"
            variant="light"
            onPress={() => {
              setCurr(item);
            }}
          >
            <InfoIcon />
          </Button>
        );
      default:
        return cellValue;
    }
  }, []);

  const topContent = useMemo(() => {
    return (
      <div className="flex flex-col gap-4">
        <div className="flex justify-between gap-3 items-end">
          <Input
            isClearable
            className="w-full sm:max-w-[44%]"
            placeholder="Digite seu CEP"
            startContent={<SearchIcon />}
          />
        </div>
      </div>
    );
  }, [users.length]);

  return (
    <>
      <Table
        isHeaderSticky
        classNames={{
          wrapper: "max-h-[calc(100vh-190px)] w-full",
        }}
        topContent={topContent}
        topContentPlacement="outside"
      >
        <TableHeader columns={headerColumns}>
          {(column) => (
            <TableColumn
              key={column.uid}
              align={column.uid === "actions" ? "center" : "start"}
              allowsSorting={column.sortable}
            >
              {column.name}
            </TableColumn>
          )}
        </TableHeader>
        <TableBody emptyContent={"No users found"} items={data.slice(0, 50)}>
          {(item) => (
            <TableRow key={item.CNES}>
              {(columnKey) => (
                <TableCell className="capitalize">
                  {renderCell(item, columnKey)}
                </TableCell>
              )}
            </TableRow>
          )}
        </TableBody>
      </Table>
      <Drawer
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        placement="right"
      >
        <DrawerContent>
          {() => (
            <>
              <DrawerHeader className="flex flex-col gap-1">
                {curr?.NOME} - {curr?.LOGRADOURO}
              </DrawerHeader>
              <DrawerBody>
                <div className="flex flex-col gap-x-3 gap-y-7">
                  <iframe
                    src={`https://www.google.com/maps?q=${curr?.LATITUDE.replace(",",".")},${curr?.LONGITUDE.replace(",",".")}&z=15&output=embed`}
                    width="100%"
                    height="450"
                    loading="lazy"
                    referrerPolicy="no-referrer-when-downgrade"
                  ></iframe>
                  <div>
                    <h4 className="font-semibold text-xl mb-3.5">Serviços</h4>
                    <ul className="flex gap-4">
                      <li><Chip color="primary">Consulta</Chip></li>
                      <li><Chip color="success">Exame</Chip></li>
                      <li><Chip color="secondary">Tratamento</Chip></li>
                      <li><Chip color="danger">Vacinação</Chip></li>
                    </ul>
                    <Spacer y={10}/>
                    <h4 className="font-semibold text-xl">Horário de atendimento</h4>
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
