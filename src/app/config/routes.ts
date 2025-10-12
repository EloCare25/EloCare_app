type Route = {
  path: string;
  title: string;
  enabled: boolean;
  icon?: string;
};

export const routes: Route[] = [
  {
    path: "/",
    title: "Home",
    enabled: true,
  },
  {
    path: "/clinicas",
    title: "Clínicas",
    enabled: false
  },
  {
    path: "/equipamentos",
    title: "Equipamentos",
    enabled: false
  },
  {
    path: "/telemedicina",
    title: "Telemedicina",
    enabled: false
  },
  {
    path: "/transporte",
    title: "Transporte",
    enabled: false
  }
]
