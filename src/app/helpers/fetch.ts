export interface ApiResponse<T = any> {
  success: boolean;
  data?: T;
  error?: string;
}

export async function get<T = any>(url: string): Promise<ApiResponse<T>> {
  try {
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`HTTP Error: ${response.status}`);
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error(error);
    throw new Error(error instanceof Error ? error.message : "Request failed");
  }
}

export default { get };
