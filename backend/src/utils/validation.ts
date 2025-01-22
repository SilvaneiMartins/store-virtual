export const validationEmail = (email: string): boolean => {
    return !!String(email)
        .toLowerCase()
        .match(/^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,12})(\.[a-z]{2,12})?$/);
};

export const validateLength = (
    text: string,
    min: number,
    max: number
): boolean => {
    return !(text.length > max || text.length < min);
};
