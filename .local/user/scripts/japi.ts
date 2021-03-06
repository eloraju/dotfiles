try {
    const data: { command?: string, data?: any } = {};
    const innerData: any = {};

    Deno.args.forEach((arg: string, index: number) => {
        if (index === 0) {

            if (!arg.match(/[a-z]+\.[a-z]+/)) {
                console.log('Command in invalid format.');
                Deno.exit(1);
            }
            data.command = arg;

        } else {

            if (!arg.match(/^[a-z]+=/)) {
                console.log('Argument in invalid format.')
                Deno.exit(1);
            }

            const key = arg.split('=')[0] as string;
            const value = arg.split('=')[1] as any;

            innerData[key] = value as any;
        }
    });

    data.data = innerData;

    const url = 'https://eloraju.xyz/api';
    const res = await fetch(url, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        headers: {
            'content-type': 'application/json'
        },
        redirect: 'follow',
        body: JSON.stringify(data)
    });

    if (res.ok) {
        console.log("Response: ",await res.json());
    } else {
        console.log("Response: (",res.status,")",await res.text());
    }
} catch (err) {
    console.log(err)
}

