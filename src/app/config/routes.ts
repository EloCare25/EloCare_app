type Route = {
  id: string;
  pathname: string;
  title: string;
  enabled: boolean;
  icon?: string;
};

export const routes: Route[] = [
  {
    id: "clinicas",
    pathname: "/clinicas",
    title: "Clínicas",
    enabled: true
  },
  {
    id: "transporte",
    pathname: "/transporte",
    title: "Transporte",
    enabled: true
  },
  {
    id: "equipamentos",
    pathname: "/equipamentos",
    title: "Equipamentos",
    enabled: false
  },
  {
    id: "telemedicina",
    pathname: "/telemedicina",
    title: "Telemedicina",
    enabled: false
  }
]
