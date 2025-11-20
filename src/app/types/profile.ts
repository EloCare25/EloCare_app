export type ProfileType = "user" | "professional";

export const PROFILE_COOKIE_NAME = "elocare_profile";
export const DEFAULT_PROFILE: ProfileType = "user";

export const PROFILE_LABELS: Record<ProfileType, string> = {
  user: "Paciente",
  professional: "Profissional",
};
