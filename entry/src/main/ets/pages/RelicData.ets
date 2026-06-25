export interface Relic {
  id: string;
  name: string;
  dynasty: string;
  museum: string;
  material: string;
  description: string;
}

export const RELICS: Relic[] = [
  { id: 'r001', name: 'Ritual Bronze Ding', dynasty: 'Western Zhou', museum: 'British Museum, London', material: 'Bronze', description: 'Ceremonial tripod vessel with taotie mask motif; used for meat offerings at ancestral rites.' },
  { id: 'r002', name: 'Celadon Longquan Vase', dynasty: 'Southern Song', museum: 'Musée Guimet, Paris', material: 'Stoneware, celadon glaze', description: 'Elegant vase prized for its jade-like green glaze, produced at the Longquan kilns.' },
  { id: 'r003', name: 'Gilt-Bronze Buddha', dynasty: 'Northern Wei', museum: 'Metropolitan Museum of Art, New York', material: 'Gilt bronze', description: 'Small devotional Buddha figure reflecting the spread of Buddhist art along trade routes.' },
  { id: 'r004', name: 'Famille Rose Plate', dynasty: 'Qing (Qianlong)', museum: 'Victoria and Albert Museum, London', material: 'Porcelain, enamel', description: 'Export porcelain plate decorated in the famille rose palette popular in the 18th century.' },
  { id: 'r005', name: 'Oracle Bone Fragment', dynasty: 'Shang', museum: 'Royal Ontario Museum, Toronto', material: 'Bone', description: 'Inscribed bone fragment used for divination, bearing some of the earliest Chinese script.' },
  { id: 'r006', name: 'Landscape Handscroll', dynasty: 'Yuan', museum: 'Cleveland Museum of Art, Ohio', material: 'Ink and color on silk', description: 'Panoramic landscape handscroll showcasing literati painting traditions of the Yuan era.' },
  { id: 'r007', name: 'White Jade Bi Disc', dynasty: 'Han', museum: 'Freer Gallery of Art, Washington D.C.', material: 'Nephrite jade', description: 'Ceremonial disc symbolizing heaven, carved from fine white jade.' },
  { id: 'r008', name: 'Dragon Robe Panel', dynasty: 'Ming', museum: 'Asian Art Museum, San Francisco', material: 'Silk, gold thread embroidery', description: 'Embroidered panel from an imperial robe, featuring dragon motifs reserved for the court.' },
  { id: 'r009', name: 'Zhou Ritual Gui Vessel', dynasty: 'Western Zhou', museum: 'Freer Gallery of Art, Washington D.C.', material: 'Bronze', description: 'Food vessel used in ancestral rituals, cast with geometric bronze-age ornamentation.' },
];
